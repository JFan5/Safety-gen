(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v8 ?v4)
             (pred_3 ?v10 ?v11)
             (pred_2 ?v8 ?v11)
             (pred_10 ?v12 ?v8 )
	     (pred_7 ?v8)
             (pred_11 ?v7)
             (pred_9 ?v10)
             (pred_5 ?v11)
             (pred_1 ?v8)
             (pred_12 ?v10)
             (pred_4 ?v8)
             (pred_8 ))



(:action op_3
:parameters (?v13 ?v1 ?v6 ?v3)
:precondition (and (pred_11 ?v13) (pred_11 ?v1) (pred_9 ?v6) (pred_5 ?v3)
          (pred_6 ?v13 ?v1) (pred_3 ?v6 ?v3)
                   (pred_2 ?v1 ?v3) (pred_7 ?v13) 
                   (pred_1 ?v1) (pred_12 ?v6))
:effect (and  (pred_4 ?v1) (not (pred_1 ?v1))))


(:action op_5
:parameters (?v13 ?v5)
:precondition (and (pred_11 ?v13) (pred_11 ?v5)
               (pred_7 ?v13) (pred_6 ?v13 ?v5) (pred_4 ?v5))
:effect (and (pred_7 ?v5) (not (pred_7 ?v13))))

(:action op_2
:parameters (?v13 ?v6)
:precondition (and (pred_11 ?v13) (pred_9 ?v6) 
                  (pred_7 ?v13) (pred_10 ?v6 ?v13) (pred_8 ))
:effect (and (pred_12 ?v6)
   (not (pred_10 ?v6 ?v13)) (not (pred_8 ))))


(:action op_1
:parameters (?v13 ?v9 ?v2)
:precondition (and (pred_11 ?v13) (pred_9 ?v9) (pred_9 ?v2)
                  (pred_7 ?v13) (pred_12 ?v2) (pred_10 ?v9 ?v13))
:effect (and (pred_12 ?v9) (pred_10 ?v2 ?v13)
        (not (pred_12 ?v2)) (not (pred_10 ?v9 ?v13))))

(:action op_4
:parameters (?v13 ?v6)
:precondition (and (pred_11 ?v13) (pred_9 ?v6) 
                  (pred_7 ?v13) (pred_12 ?v6))
:effect (and (pred_8 ) (pred_10 ?v6 ?v13) (not (pred_12 ?v6)))))


	
