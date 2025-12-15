(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v1 ?v6)
             (pred_9 ?v2 ?v5)
             (pred_1 ?v1 ?v5)
             (pred_2 ?v8 ?v1 )
	     (pred_4 ?v1)
             (pred_7 ?v9)
             (pred_8 ?v2)
             (pred_11 ?v5)
             (pred_5 ?v1)
             (pred_6 ?v2)
             (pred_12 ?v1)
             (pred_10 ))



(:action op_3
:parameters (?v11 ?v7 ?v12 ?v3)
:precondition (and (pred_7 ?v11) (pred_7 ?v7) (pred_8 ?v12) (pred_11 ?v3)
          (pred_3 ?v11 ?v7) (pred_9 ?v12 ?v3)
                   (pred_1 ?v7 ?v3) (pred_4 ?v11) 
                   (pred_5 ?v7) (pred_6 ?v12))
:effect (and  (pred_12 ?v7) (not (pred_5 ?v7))))


(:action op_2
:parameters (?v11 ?v10)
:precondition (and (pred_7 ?v11) (pred_7 ?v10)
               (pred_4 ?v11) (pred_3 ?v11 ?v10) (pred_12 ?v10))
:effect (and (pred_4 ?v10) (not (pred_4 ?v11))))

(:action op_1
:parameters (?v11 ?v12)
:precondition (and (pred_7 ?v11) (pred_8 ?v12) 
                  (pred_4 ?v11) (pred_2 ?v12 ?v11) (pred_10 ))
:effect (and (pred_6 ?v12)
   (not (pred_2 ?v12 ?v11)) (not (pred_10 ))))


(:action op_5
:parameters (?v11 ?v13 ?v4)
:precondition (and (pred_7 ?v11) (pred_8 ?v13) (pred_8 ?v4)
                  (pred_4 ?v11) (pred_6 ?v4) (pred_2 ?v13 ?v11))
:effect (and (pred_6 ?v13) (pred_2 ?v4 ?v11)
        (not (pred_6 ?v4)) (not (pred_2 ?v13 ?v11))))

(:action op_4
:parameters (?v11 ?v12)
:precondition (and (pred_7 ?v11) (pred_8 ?v12) 
                  (pred_4 ?v11) (pred_6 ?v12))
:effect (and (pred_10 ) (pred_2 ?v12 ?v11) (not (pred_6 ?v12)))))


	
