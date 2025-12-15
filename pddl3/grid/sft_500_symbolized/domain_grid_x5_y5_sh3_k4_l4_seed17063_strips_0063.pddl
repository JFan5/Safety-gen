(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v9 ?v8)
             (pred_5 ?v4 ?v12)
             (pred_4 ?v9 ?v12)
             (pred_6 ?v10 ?v9 )
	     (pred_12 ?v9)
             (pred_8 ?v3)
             (pred_11 ?v4)
             (pred_3 ?v12)
             (pred_10 ?v9)
             (pred_9 ?v4)
             (pred_2 ?v9)
             (pred_1 ))



(:action op_4
:parameters (?v5 ?v1 ?v6 ?v2)
:precondition (and (pred_8 ?v5) (pred_8 ?v1) (pred_11 ?v6) (pred_3 ?v2)
          (pred_7 ?v5 ?v1) (pred_5 ?v6 ?v2)
                   (pred_4 ?v1 ?v2) (pred_12 ?v5) 
                   (pred_10 ?v1) (pred_9 ?v6))
:effect (and  (pred_2 ?v1) (not (pred_10 ?v1))))


(:action op_3
:parameters (?v5 ?v7)
:precondition (and (pred_8 ?v5) (pred_8 ?v7)
               (pred_12 ?v5) (pred_7 ?v5 ?v7) (pred_2 ?v7))
:effect (and (pred_12 ?v7) (not (pred_12 ?v5))))

(:action op_1
:parameters (?v5 ?v6)
:precondition (and (pred_8 ?v5) (pred_11 ?v6) 
                  (pred_12 ?v5) (pred_6 ?v6 ?v5) (pred_1 ))
:effect (and (pred_9 ?v6)
   (not (pred_6 ?v6 ?v5)) (not (pred_1 ))))


(:action op_5
:parameters (?v5 ?v13 ?v11)
:precondition (and (pred_8 ?v5) (pred_11 ?v13) (pred_11 ?v11)
                  (pred_12 ?v5) (pred_9 ?v11) (pred_6 ?v13 ?v5))
:effect (and (pred_9 ?v13) (pred_6 ?v11 ?v5)
        (not (pred_9 ?v11)) (not (pred_6 ?v13 ?v5))))

(:action op_2
:parameters (?v5 ?v6)
:precondition (and (pred_8 ?v5) (pred_11 ?v6) 
                  (pred_12 ?v5) (pred_9 ?v6))
:effect (and (pred_1 ) (pred_6 ?v6 ?v5) (not (pred_9 ?v6)))))


	
