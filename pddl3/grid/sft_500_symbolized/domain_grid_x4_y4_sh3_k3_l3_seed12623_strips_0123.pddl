(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v9 ?v5)
             (pred_7 ?v8 ?v12)
             (pred_6 ?v9 ?v12)
             (pred_9 ?v10 ?v9 )
	     (pred_5 ?v9)
             (pred_11 ?v2)
             (pred_1 ?v8)
             (pred_3 ?v12)
             (pred_8 ?v9)
             (pred_2 ?v8)
             (pred_12 ?v9)
             (pred_4 ))



(:action op_4
:parameters (?v1 ?v13 ?v6 ?v4)
:precondition (and (pred_11 ?v1) (pred_11 ?v13) (pred_1 ?v6) (pred_3 ?v4)
          (pred_10 ?v1 ?v13) (pred_7 ?v6 ?v4)
                   (pred_6 ?v13 ?v4) (pred_5 ?v1) 
                   (pred_8 ?v13) (pred_2 ?v6))
:effect (and  (pred_12 ?v13) (not (pred_8 ?v13))))


(:action op_2
:parameters (?v1 ?v3)
:precondition (and (pred_11 ?v1) (pred_11 ?v3)
               (pred_5 ?v1) (pred_10 ?v1 ?v3) (pred_12 ?v3))
:effect (and (pred_5 ?v3) (not (pred_5 ?v1))))

(:action op_5
:parameters (?v1 ?v6)
:precondition (and (pred_11 ?v1) (pred_1 ?v6) 
                  (pred_5 ?v1) (pred_9 ?v6 ?v1) (pred_4 ))
:effect (and (pred_2 ?v6)
   (not (pred_9 ?v6 ?v1)) (not (pred_4 ))))


(:action op_1
:parameters (?v1 ?v7 ?v11)
:precondition (and (pred_11 ?v1) (pred_1 ?v7) (pred_1 ?v11)
                  (pred_5 ?v1) (pred_2 ?v11) (pred_9 ?v7 ?v1))
:effect (and (pred_2 ?v7) (pred_9 ?v11 ?v1)
        (not (pred_2 ?v11)) (not (pred_9 ?v7 ?v1))))

(:action op_3
:parameters (?v1 ?v6)
:precondition (and (pred_11 ?v1) (pred_1 ?v6) 
                  (pred_5 ?v1) (pred_2 ?v6))
:effect (and (pred_4 ) (pred_9 ?v6 ?v1) (not (pred_2 ?v6)))))


	
