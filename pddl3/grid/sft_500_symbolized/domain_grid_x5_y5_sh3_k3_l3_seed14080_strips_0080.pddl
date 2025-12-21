(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v10 ?v4)
             (pred_2 ?v8 ?v5)
             (pred_6 ?v10 ?v5)
             (pred_8 ?v13 ?v10 )
	     (pred_3 ?v10)
             (pred_9 ?v12)
             (pred_12 ?v8)
             (pred_10 ?v5)
             (pred_1 ?v10)
             (pred_11 ?v8)
             (pred_5 ?v10)
             (pred_4 ))



(:action op_3
:parameters (?v6 ?v2 ?v3 ?v7)
:precondition (and (pred_9 ?v6) (pred_9 ?v2) (pred_12 ?v3) (pred_10 ?v7)
          (pred_7 ?v6 ?v2) (pred_2 ?v3 ?v7)
                   (pred_6 ?v2 ?v7) (pred_3 ?v6) 
                   (pred_1 ?v2) (pred_11 ?v3))
:effect (and  (pred_5 ?v2) (not (pred_1 ?v2))))


(:action op_4
:parameters (?v6 ?v1)
:precondition (and (pred_9 ?v6) (pred_9 ?v1)
               (pred_3 ?v6) (pred_7 ?v6 ?v1) (pred_5 ?v1))
:effect (and (pred_3 ?v1) (not (pred_3 ?v6))))

(:action op_5
:parameters (?v6 ?v3)
:precondition (and (pred_9 ?v6) (pred_12 ?v3) 
                  (pred_3 ?v6) (pred_8 ?v3 ?v6) (pred_4 ))
:effect (and (pred_11 ?v3)
   (not (pred_8 ?v3 ?v6)) (not (pred_4 ))))


(:action op_2
:parameters (?v6 ?v9 ?v11)
:precondition (and (pred_9 ?v6) (pred_12 ?v9) (pred_12 ?v11)
                  (pred_3 ?v6) (pred_11 ?v11) (pred_8 ?v9 ?v6))
:effect (and (pred_11 ?v9) (pred_8 ?v11 ?v6)
        (not (pred_11 ?v11)) (not (pred_8 ?v9 ?v6))))

(:action op_1
:parameters (?v6 ?v3)
:precondition (and (pred_9 ?v6) (pred_12 ?v3) 
                  (pred_3 ?v6) (pred_11 ?v3))
:effect (and (pred_4 ) (pred_8 ?v3 ?v6) (not (pred_11 ?v3)))))


	
