(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v2 ?v5)
             (pred_7 ?v13 ?v6)
             (pred_2 ?v2 ?v6)
             (pred_3 ?v12 ?v2 )
	     (pred_10 ?v2)
             (pred_12 ?v4)
             (pred_5 ?v13)
             (pred_4 ?v6)
             (pred_1 ?v2)
             (pred_9 ?v13)
             (pred_6 ?v2)
             (pred_8 ))



(:action op_1
:parameters (?v7 ?v1 ?v3 ?v9)
:precondition (and (pred_12 ?v7) (pred_12 ?v1) (pred_5 ?v3) (pred_4 ?v9)
          (pred_11 ?v7 ?v1) (pred_7 ?v3 ?v9)
                   (pred_2 ?v1 ?v9) (pred_10 ?v7) 
                   (pred_1 ?v1) (pred_9 ?v3))
:effect (and  (pred_6 ?v1) (not (pred_1 ?v1))))


(:action op_2
:parameters (?v7 ?v8)
:precondition (and (pred_12 ?v7) (pred_12 ?v8)
               (pred_10 ?v7) (pred_11 ?v7 ?v8) (pred_6 ?v8))
:effect (and (pred_10 ?v8) (not (pred_10 ?v7))))

(:action op_5
:parameters (?v7 ?v3)
:precondition (and (pred_12 ?v7) (pred_5 ?v3) 
                  (pred_10 ?v7) (pred_3 ?v3 ?v7) (pred_8 ))
:effect (and (pred_9 ?v3)
   (not (pred_3 ?v3 ?v7)) (not (pred_8 ))))


(:action op_4
:parameters (?v7 ?v10 ?v11)
:precondition (and (pred_12 ?v7) (pred_5 ?v10) (pred_5 ?v11)
                  (pred_10 ?v7) (pred_9 ?v11) (pred_3 ?v10 ?v7))
:effect (and (pred_9 ?v10) (pred_3 ?v11 ?v7)
        (not (pred_9 ?v11)) (not (pred_3 ?v10 ?v7))))

(:action op_3
:parameters (?v7 ?v3)
:precondition (and (pred_12 ?v7) (pred_5 ?v3) 
                  (pred_10 ?v7) (pred_9 ?v3))
:effect (and (pred_8 ) (pred_3 ?v3 ?v7) (not (pred_9 ?v3)))))


	
