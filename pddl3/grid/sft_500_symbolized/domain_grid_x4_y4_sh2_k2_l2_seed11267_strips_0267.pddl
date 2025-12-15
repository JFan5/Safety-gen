(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v3 ?v8)
             (pred_2 ?v13 ?v9)
             (pred_3 ?v3 ?v9)
             (pred_10 ?v2 ?v3 )
	     (pred_8 ?v3)
             (pred_1 ?v4)
             (pred_9 ?v13)
             (pred_12 ?v9)
             (pred_11 ?v3)
             (pred_4 ?v13)
             (pred_6 ?v3)
             (pred_7 ))



(:action op_3
:parameters (?v11 ?v5 ?v12 ?v7)
:precondition (and (pred_1 ?v11) (pred_1 ?v5) (pred_9 ?v12) (pred_12 ?v7)
          (pred_5 ?v11 ?v5) (pred_2 ?v12 ?v7)
                   (pred_3 ?v5 ?v7) (pred_8 ?v11) 
                   (pred_11 ?v5) (pred_4 ?v12))
:effect (and  (pred_6 ?v5) (not (pred_11 ?v5))))


(:action op_1
:parameters (?v11 ?v10)
:precondition (and (pred_1 ?v11) (pred_1 ?v10)
               (pred_8 ?v11) (pred_5 ?v11 ?v10) (pred_6 ?v10))
:effect (and (pred_8 ?v10) (not (pred_8 ?v11))))

(:action op_5
:parameters (?v11 ?v12)
:precondition (and (pred_1 ?v11) (pred_9 ?v12) 
                  (pred_8 ?v11) (pred_10 ?v12 ?v11) (pred_7 ))
:effect (and (pred_4 ?v12)
   (not (pred_10 ?v12 ?v11)) (not (pred_7 ))))


(:action op_4
:parameters (?v11 ?v1 ?v6)
:precondition (and (pred_1 ?v11) (pred_9 ?v1) (pred_9 ?v6)
                  (pred_8 ?v11) (pred_4 ?v6) (pred_10 ?v1 ?v11))
:effect (and (pred_4 ?v1) (pred_10 ?v6 ?v11)
        (not (pred_4 ?v6)) (not (pred_10 ?v1 ?v11))))

(:action op_2
:parameters (?v11 ?v12)
:precondition (and (pred_1 ?v11) (pred_9 ?v12) 
                  (pred_8 ?v11) (pred_4 ?v12))
:effect (and (pred_7 ) (pred_10 ?v12 ?v11) (not (pred_4 ?v12)))))


	
