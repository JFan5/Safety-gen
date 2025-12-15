(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v7 ?v10)
             (pred_11 ?v12 ?v8)
             (pred_2 ?v7 ?v8)
             (pred_4 ?v9 ?v7 )
	     (pred_8 ?v7)
             (pred_3 ?v6)
             (pred_5 ?v12)
             (pred_1 ?v8)
             (pred_10 ?v7)
             (pred_6 ?v12)
             (pred_12 ?v7)
             (pred_7 ))



(:action op_3
:parameters (?v4 ?v3 ?v11 ?v5)
:precondition (and (pred_3 ?v4) (pred_3 ?v3) (pred_5 ?v11) (pred_1 ?v5)
          (pred_9 ?v4 ?v3) (pred_11 ?v11 ?v5)
                   (pred_2 ?v3 ?v5) (pred_8 ?v4) 
                   (pred_10 ?v3) (pred_6 ?v11))
:effect (and  (pred_12 ?v3) (not (pred_10 ?v3))))


(:action op_2
:parameters (?v4 ?v2)
:precondition (and (pred_3 ?v4) (pred_3 ?v2)
               (pred_8 ?v4) (pred_9 ?v4 ?v2) (pred_12 ?v2))
:effect (and (pred_8 ?v2) (not (pred_8 ?v4))))

(:action op_4
:parameters (?v4 ?v11)
:precondition (and (pred_3 ?v4) (pred_5 ?v11) 
                  (pred_8 ?v4) (pred_4 ?v11 ?v4) (pred_7 ))
:effect (and (pred_6 ?v11)
   (not (pred_4 ?v11 ?v4)) (not (pred_7 ))))


(:action op_5
:parameters (?v4 ?v13 ?v1)
:precondition (and (pred_3 ?v4) (pred_5 ?v13) (pred_5 ?v1)
                  (pred_8 ?v4) (pred_6 ?v1) (pred_4 ?v13 ?v4))
:effect (and (pred_6 ?v13) (pred_4 ?v1 ?v4)
        (not (pred_6 ?v1)) (not (pred_4 ?v13 ?v4))))

(:action op_1
:parameters (?v4 ?v11)
:precondition (and (pred_3 ?v4) (pred_5 ?v11) 
                  (pred_8 ?v4) (pred_6 ?v11))
:effect (and (pred_7 ) (pred_4 ?v11 ?v4) (not (pred_6 ?v11)))))


	
