(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v8 ?v7)
             (pred_6 ?v10 ?v1)
             (pred_4 ?v8 ?v1)
             (pred_9 ?v9 ?v8 )
	     (pred_12 ?v8)
             (pred_5 ?v11)
             (pred_1 ?v10)
             (pred_7 ?v1)
             (pred_10 ?v8)
             (pred_8 ?v10)
             (pred_3 ?v8)
             (pred_11 ))



(:action op_1
:parameters (?v6 ?v13 ?v4 ?v3)
:precondition (and (pred_5 ?v6) (pred_5 ?v13) (pred_1 ?v4) (pred_7 ?v3)
          (pred_2 ?v6 ?v13) (pred_6 ?v4 ?v3)
                   (pred_4 ?v13 ?v3) (pred_12 ?v6) 
                   (pred_10 ?v13) (pred_8 ?v4))
:effect (and  (pred_3 ?v13) (not (pred_10 ?v13))))


(:action op_5
:parameters (?v6 ?v5)
:precondition (and (pred_5 ?v6) (pred_5 ?v5)
               (pred_12 ?v6) (pred_2 ?v6 ?v5) (pred_3 ?v5))
:effect (and (pred_12 ?v5) (not (pred_12 ?v6))))

(:action op_4
:parameters (?v6 ?v4)
:precondition (and (pred_5 ?v6) (pred_1 ?v4) 
                  (pred_12 ?v6) (pred_9 ?v4 ?v6) (pred_11 ))
:effect (and (pred_8 ?v4)
   (not (pred_9 ?v4 ?v6)) (not (pred_11 ))))


(:action op_3
:parameters (?v6 ?v2 ?v12)
:precondition (and (pred_5 ?v6) (pred_1 ?v2) (pred_1 ?v12)
                  (pred_12 ?v6) (pred_8 ?v12) (pred_9 ?v2 ?v6))
:effect (and (pred_8 ?v2) (pred_9 ?v12 ?v6)
        (not (pred_8 ?v12)) (not (pred_9 ?v2 ?v6))))

(:action op_2
:parameters (?v6 ?v4)
:precondition (and (pred_5 ?v6) (pred_1 ?v4) 
                  (pred_12 ?v6) (pred_8 ?v4))
:effect (and (pred_11 ) (pred_9 ?v4 ?v6) (not (pred_8 ?v4)))))


	
