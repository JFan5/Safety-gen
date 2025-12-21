(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v8 ?v9)
             (pred_7 ?v10 ?v11)
             (pred_2 ?v8 ?v11)
             (pred_3 ?v12 ?v8 )
	     (pred_11 ?v8)
             (pred_8 ?v7)
             (pred_1 ?v10)
             (pred_9 ?v11)
             (pred_12 ?v8)
             (pred_6 ?v10)
             (pred_4 ?v8)
             (pred_10 ))



(:action op_2
:parameters (?v1 ?v5 ?v6 ?v3)
:precondition (and (pred_8 ?v1) (pred_8 ?v5) (pred_1 ?v6) (pred_9 ?v3)
          (pred_5 ?v1 ?v5) (pred_7 ?v6 ?v3)
                   (pred_2 ?v5 ?v3) (pred_11 ?v1) 
                   (pred_12 ?v5) (pred_6 ?v6))
:effect (and  (pred_4 ?v5) (not (pred_12 ?v5))))


(:action op_4
:parameters (?v1 ?v4)
:precondition (and (pred_8 ?v1) (pred_8 ?v4)
               (pred_11 ?v1) (pred_5 ?v1 ?v4) (pred_4 ?v4))
:effect (and (pred_11 ?v4) (not (pred_11 ?v1))))

(:action op_3
:parameters (?v1 ?v6)
:precondition (and (pred_8 ?v1) (pred_1 ?v6) 
                  (pred_11 ?v1) (pred_3 ?v6 ?v1) (pred_10 ))
:effect (and (pred_6 ?v6)
   (not (pred_3 ?v6 ?v1)) (not (pred_10 ))))


(:action op_5
:parameters (?v1 ?v13 ?v2)
:precondition (and (pred_8 ?v1) (pred_1 ?v13) (pred_1 ?v2)
                  (pred_11 ?v1) (pred_6 ?v2) (pred_3 ?v13 ?v1))
:effect (and (pred_6 ?v13) (pred_3 ?v2 ?v1)
        (not (pred_6 ?v2)) (not (pred_3 ?v13 ?v1))))

(:action op_1
:parameters (?v1 ?v6)
:precondition (and (pred_8 ?v1) (pred_1 ?v6) 
                  (pred_11 ?v1) (pred_6 ?v6))
:effect (and (pred_10 ) (pred_3 ?v6 ?v1) (not (pred_6 ?v6)))))


	
