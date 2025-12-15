(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v3 ?v2)
             (pred_8 ?v4 ?v6)
             (pred_6 ?v3 ?v6)
             (pred_10 ?v8 ?v3 )
	     (pred_1 ?v3)
             (pred_11 ?v7)
             (pred_2 ?v4)
             (pred_4 ?v6)
             (pred_5 ?v3)
             (pred_3 ?v4)
             (pred_7 ?v3)
             (pred_9 ))



(:action op_4
:parameters (?v5 ?v1 ?v9 ?v10)
:precondition (and (pred_11 ?v5) (pred_11 ?v1) (pred_2 ?v9) (pred_4 ?v10)
          (pred_12 ?v5 ?v1) (pred_8 ?v9 ?v10)
                   (pred_6 ?v1 ?v10) (pred_1 ?v5) 
                   (pred_5 ?v1) (pred_3 ?v9))
:effect (and  (pred_7 ?v1) (not (pred_5 ?v1))))


(:action op_2
:parameters (?v5 ?v12)
:precondition (and (pred_11 ?v5) (pred_11 ?v12)
               (pred_1 ?v5) (pred_12 ?v5 ?v12) (pred_7 ?v12))
:effect (and (pred_1 ?v12) (not (pred_1 ?v5))))

(:action op_5
:parameters (?v5 ?v9)
:precondition (and (pred_11 ?v5) (pred_2 ?v9) 
                  (pred_1 ?v5) (pred_10 ?v9 ?v5) (pred_9 ))
:effect (and (pred_3 ?v9)
   (not (pred_10 ?v9 ?v5)) (not (pred_9 ))))


(:action op_3
:parameters (?v5 ?v11 ?v13)
:precondition (and (pred_11 ?v5) (pred_2 ?v11) (pred_2 ?v13)
                  (pred_1 ?v5) (pred_3 ?v13) (pred_10 ?v11 ?v5))
:effect (and (pred_3 ?v11) (pred_10 ?v13 ?v5)
        (not (pred_3 ?v13)) (not (pred_10 ?v11 ?v5))))

(:action op_1
:parameters (?v5 ?v9)
:precondition (and (pred_11 ?v5) (pred_2 ?v9) 
                  (pred_1 ?v5) (pred_3 ?v9))
:effect (and (pred_9 ) (pred_10 ?v9 ?v5) (not (pred_3 ?v9)))))


	
