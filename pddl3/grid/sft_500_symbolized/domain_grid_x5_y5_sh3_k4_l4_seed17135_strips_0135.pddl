(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v10 ?v13)
             (pred_5 ?v1 ?v4)
             (pred_12 ?v10 ?v4)
             (pred_1 ?v11 ?v10 )
	     (pred_4 ?v10)
             (pred_10 ?v9)
             (pred_6 ?v1)
             (pred_7 ?v4)
             (pred_3 ?v10)
             (pred_11 ?v1)
             (pred_9 ?v10)
             (pred_2 ))



(:action op_4
:parameters (?v5 ?v12 ?v6 ?v3)
:precondition (and (pred_10 ?v5) (pred_10 ?v12) (pred_6 ?v6) (pred_7 ?v3)
          (pred_8 ?v5 ?v12) (pred_5 ?v6 ?v3)
                   (pred_12 ?v12 ?v3) (pred_4 ?v5) 
                   (pred_3 ?v12) (pred_11 ?v6))
:effect (and  (pred_9 ?v12) (not (pred_3 ?v12))))


(:action op_1
:parameters (?v5 ?v8)
:precondition (and (pred_10 ?v5) (pred_10 ?v8)
               (pred_4 ?v5) (pred_8 ?v5 ?v8) (pred_9 ?v8))
:effect (and (pred_4 ?v8) (not (pred_4 ?v5))))

(:action op_3
:parameters (?v5 ?v6)
:precondition (and (pred_10 ?v5) (pred_6 ?v6) 
                  (pred_4 ?v5) (pred_1 ?v6 ?v5) (pred_2 ))
:effect (and (pred_11 ?v6)
   (not (pred_1 ?v6 ?v5)) (not (pred_2 ))))


(:action op_2
:parameters (?v5 ?v2 ?v7)
:precondition (and (pred_10 ?v5) (pred_6 ?v2) (pred_6 ?v7)
                  (pred_4 ?v5) (pred_11 ?v7) (pred_1 ?v2 ?v5))
:effect (and (pred_11 ?v2) (pred_1 ?v7 ?v5)
        (not (pred_11 ?v7)) (not (pred_1 ?v2 ?v5))))

(:action op_5
:parameters (?v5 ?v6)
:precondition (and (pred_10 ?v5) (pred_6 ?v6) 
                  (pred_4 ?v5) (pred_11 ?v6))
:effect (and (pred_2 ) (pred_1 ?v6 ?v5) (not (pred_11 ?v6)))))


	
