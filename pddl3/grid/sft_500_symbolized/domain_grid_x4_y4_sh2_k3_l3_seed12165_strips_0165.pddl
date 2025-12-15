(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v12 ?v9)
             (pred_9 ?v2 ?v3)
             (pred_3 ?v12 ?v3)
             (pred_6 ?v8 ?v12 )
	     (pred_1 ?v12)
             (pred_7 ?v6)
             (pred_2 ?v2)
             (pred_10 ?v3)
             (pred_4 ?v12)
             (pred_12 ?v2)
             (pred_11 ?v12)
             (pred_5 ))



(:action op_3
:parameters (?v7 ?v10 ?v1 ?v13)
:precondition (and (pred_7 ?v7) (pred_7 ?v10) (pred_2 ?v1) (pred_10 ?v13)
          (pred_8 ?v7 ?v10) (pred_9 ?v1 ?v13)
                   (pred_3 ?v10 ?v13) (pred_1 ?v7) 
                   (pred_4 ?v10) (pred_12 ?v1))
:effect (and  (pred_11 ?v10) (not (pred_4 ?v10))))


(:action op_4
:parameters (?v7 ?v5)
:precondition (and (pred_7 ?v7) (pred_7 ?v5)
               (pred_1 ?v7) (pred_8 ?v7 ?v5) (pred_11 ?v5))
:effect (and (pred_1 ?v5) (not (pred_1 ?v7))))

(:action op_1
:parameters (?v7 ?v1)
:precondition (and (pred_7 ?v7) (pred_2 ?v1) 
                  (pred_1 ?v7) (pred_6 ?v1 ?v7) (pred_5 ))
:effect (and (pred_12 ?v1)
   (not (pred_6 ?v1 ?v7)) (not (pred_5 ))))


(:action op_5
:parameters (?v7 ?v4 ?v11)
:precondition (and (pred_7 ?v7) (pred_2 ?v4) (pred_2 ?v11)
                  (pred_1 ?v7) (pred_12 ?v11) (pred_6 ?v4 ?v7))
:effect (and (pred_12 ?v4) (pred_6 ?v11 ?v7)
        (not (pred_12 ?v11)) (not (pred_6 ?v4 ?v7))))

(:action op_2
:parameters (?v7 ?v1)
:precondition (and (pred_7 ?v7) (pred_2 ?v1) 
                  (pred_1 ?v7) (pred_12 ?v1))
:effect (and (pred_5 ) (pred_6 ?v1 ?v7) (not (pred_12 ?v1)))))


	
