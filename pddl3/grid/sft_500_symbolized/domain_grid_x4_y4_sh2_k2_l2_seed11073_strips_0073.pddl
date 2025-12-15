(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v3 ?v9)
             (pred_5 ?v10 ?v12)
             (pred_8 ?v3 ?v12)
             (pred_1 ?v11 ?v3 )
	     (pred_11 ?v3)
             (pred_2 ?v4)
             (pred_3 ?v10)
             (pred_9 ?v12)
             (pred_7 ?v3)
             (pred_10 ?v10)
             (pred_4 ?v3)
             (pred_6 ))



(:action op_5
:parameters (?v5 ?v1 ?v7 ?v8)
:precondition (and (pred_2 ?v5) (pred_2 ?v1) (pred_3 ?v7) (pred_9 ?v8)
          (pred_12 ?v5 ?v1) (pred_5 ?v7 ?v8)
                   (pred_8 ?v1 ?v8) (pred_11 ?v5) 
                   (pred_7 ?v1) (pred_10 ?v7))
:effect (and  (pred_4 ?v1) (not (pred_7 ?v1))))


(:action op_4
:parameters (?v5 ?v13)
:precondition (and (pred_2 ?v5) (pred_2 ?v13)
               (pred_11 ?v5) (pred_12 ?v5 ?v13) (pred_4 ?v13))
:effect (and (pred_11 ?v13) (not (pred_11 ?v5))))

(:action op_2
:parameters (?v5 ?v7)
:precondition (and (pred_2 ?v5) (pred_3 ?v7) 
                  (pred_11 ?v5) (pred_1 ?v7 ?v5) (pred_6 ))
:effect (and (pred_10 ?v7)
   (not (pred_1 ?v7 ?v5)) (not (pred_6 ))))


(:action op_1
:parameters (?v5 ?v6 ?v2)
:precondition (and (pred_2 ?v5) (pred_3 ?v6) (pred_3 ?v2)
                  (pred_11 ?v5) (pred_10 ?v2) (pred_1 ?v6 ?v5))
:effect (and (pred_10 ?v6) (pred_1 ?v2 ?v5)
        (not (pred_10 ?v2)) (not (pred_1 ?v6 ?v5))))

(:action op_3
:parameters (?v5 ?v7)
:precondition (and (pred_2 ?v5) (pred_3 ?v7) 
                  (pred_11 ?v5) (pred_10 ?v7))
:effect (and (pred_6 ) (pred_1 ?v7 ?v5) (not (pred_10 ?v7)))))


	
