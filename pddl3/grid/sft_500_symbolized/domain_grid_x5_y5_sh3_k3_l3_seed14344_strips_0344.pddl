(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v9 ?v4)
             (pred_7 ?v5 ?v8)
             (pred_4 ?v9 ?v8)
             (pred_9 ?v6 ?v9 )
	     (pred_10 ?v9)
             (pred_12 ?v12)
             (pred_3 ?v5)
             (pred_5 ?v8)
             (pred_1 ?v9)
             (pred_6 ?v5)
             (pred_11 ?v9)
             (pred_2 ))



(:action op_4
:parameters (?v7 ?v2 ?v3 ?v10)
:precondition (and (pred_12 ?v7) (pred_12 ?v2) (pred_3 ?v3) (pred_5 ?v10)
          (pred_8 ?v7 ?v2) (pred_7 ?v3 ?v10)
                   (pred_4 ?v2 ?v10) (pred_10 ?v7) 
                   (pred_1 ?v2) (pred_6 ?v3))
:effect (and  (pred_11 ?v2) (not (pred_1 ?v2))))


(:action op_3
:parameters (?v7 ?v11)
:precondition (and (pred_12 ?v7) (pred_12 ?v11)
               (pred_10 ?v7) (pred_8 ?v7 ?v11) (pred_11 ?v11))
:effect (and (pred_10 ?v11) (not (pred_10 ?v7))))

(:action op_5
:parameters (?v7 ?v3)
:precondition (and (pred_12 ?v7) (pred_3 ?v3) 
                  (pred_10 ?v7) (pred_9 ?v3 ?v7) (pred_2 ))
:effect (and (pred_6 ?v3)
   (not (pred_9 ?v3 ?v7)) (not (pred_2 ))))


(:action op_2
:parameters (?v7 ?v13 ?v1)
:precondition (and (pred_12 ?v7) (pred_3 ?v13) (pred_3 ?v1)
                  (pred_10 ?v7) (pred_6 ?v1) (pred_9 ?v13 ?v7))
:effect (and (pred_6 ?v13) (pred_9 ?v1 ?v7)
        (not (pred_6 ?v1)) (not (pred_9 ?v13 ?v7))))

(:action op_1
:parameters (?v7 ?v3)
:precondition (and (pred_12 ?v7) (pred_3 ?v3) 
                  (pred_10 ?v7) (pred_6 ?v3))
:effect (and (pred_2 ) (pred_9 ?v3 ?v7) (not (pred_6 ?v3)))))


	
