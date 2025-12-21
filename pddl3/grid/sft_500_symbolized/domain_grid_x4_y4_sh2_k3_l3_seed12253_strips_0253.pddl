(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v8 ?v10)
             (pred_4 ?v13 ?v4)
             (pred_9 ?v8 ?v4)
             (pred_7 ?v9 ?v8 )
	     (pred_1 ?v8)
             (pred_8 ?v2)
             (pred_10 ?v13)
             (pred_11 ?v4)
             (pred_12 ?v8)
             (pred_6 ?v13)
             (pred_5 ?v8)
             (pred_3 ))



(:action op_4
:parameters (?v11 ?v7 ?v3 ?v1)
:precondition (and (pred_8 ?v11) (pred_8 ?v7) (pred_10 ?v3) (pred_11 ?v1)
          (pred_2 ?v11 ?v7) (pred_4 ?v3 ?v1)
                   (pred_9 ?v7 ?v1) (pred_1 ?v11) 
                   (pred_12 ?v7) (pred_6 ?v3))
:effect (and  (pred_5 ?v7) (not (pred_12 ?v7))))


(:action op_5
:parameters (?v11 ?v12)
:precondition (and (pred_8 ?v11) (pred_8 ?v12)
               (pred_1 ?v11) (pred_2 ?v11 ?v12) (pred_5 ?v12))
:effect (and (pred_1 ?v12) (not (pred_1 ?v11))))

(:action op_1
:parameters (?v11 ?v3)
:precondition (and (pred_8 ?v11) (pred_10 ?v3) 
                  (pred_1 ?v11) (pred_7 ?v3 ?v11) (pred_3 ))
:effect (and (pred_6 ?v3)
   (not (pred_7 ?v3 ?v11)) (not (pred_3 ))))


(:action op_2
:parameters (?v11 ?v5 ?v6)
:precondition (and (pred_8 ?v11) (pred_10 ?v5) (pred_10 ?v6)
                  (pred_1 ?v11) (pred_6 ?v6) (pred_7 ?v5 ?v11))
:effect (and (pred_6 ?v5) (pred_7 ?v6 ?v11)
        (not (pred_6 ?v6)) (not (pred_7 ?v5 ?v11))))

(:action op_3
:parameters (?v11 ?v3)
:precondition (and (pred_8 ?v11) (pred_10 ?v3) 
                  (pred_1 ?v11) (pred_6 ?v3))
:effect (and (pred_3 ) (pred_7 ?v3 ?v11) (not (pred_6 ?v3)))))


	
