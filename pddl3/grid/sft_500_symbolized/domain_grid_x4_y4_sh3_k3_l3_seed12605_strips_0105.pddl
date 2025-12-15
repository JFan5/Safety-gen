(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v10 ?v11)
             (pred_7 ?v4 ?v7)
             (pred_2 ?v10 ?v7)
             (pred_9 ?v12 ?v10 )
	     (pred_4 ?v10)
             (pred_10 ?v13)
             (pred_5 ?v4)
             (pred_8 ?v7)
             (pred_11 ?v10)
             (pred_1 ?v4)
             (pred_12 ?v10)
             (pred_6 ))



(:action op_3
:parameters (?v6 ?v3 ?v5 ?v9)
:precondition (and (pred_10 ?v6) (pred_10 ?v3) (pred_5 ?v5) (pred_8 ?v9)
          (pred_3 ?v6 ?v3) (pred_7 ?v5 ?v9)
                   (pred_2 ?v3 ?v9) (pred_4 ?v6) 
                   (pred_11 ?v3) (pred_1 ?v5))
:effect (and  (pred_12 ?v3) (not (pred_11 ?v3))))


(:action op_5
:parameters (?v6 ?v8)
:precondition (and (pred_10 ?v6) (pred_10 ?v8)
               (pred_4 ?v6) (pred_3 ?v6 ?v8) (pred_12 ?v8))
:effect (and (pred_4 ?v8) (not (pred_4 ?v6))))

(:action op_4
:parameters (?v6 ?v5)
:precondition (and (pred_10 ?v6) (pred_5 ?v5) 
                  (pred_4 ?v6) (pred_9 ?v5 ?v6) (pred_6 ))
:effect (and (pred_1 ?v5)
   (not (pred_9 ?v5 ?v6)) (not (pred_6 ))))


(:action op_1
:parameters (?v6 ?v1 ?v2)
:precondition (and (pred_10 ?v6) (pred_5 ?v1) (pred_5 ?v2)
                  (pred_4 ?v6) (pred_1 ?v2) (pred_9 ?v1 ?v6))
:effect (and (pred_1 ?v1) (pred_9 ?v2 ?v6)
        (not (pred_1 ?v2)) (not (pred_9 ?v1 ?v6))))

(:action op_2
:parameters (?v6 ?v5)
:precondition (and (pred_10 ?v6) (pred_5 ?v5) 
                  (pred_4 ?v6) (pred_1 ?v5))
:effect (and (pred_6 ) (pred_9 ?v5 ?v6) (not (pred_1 ?v5)))))


	
