(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v3 ?v11)
             (pred_8 ?v12 ?v7)
             (pred_9 ?v3 ?v7)
             (pred_2 ?v5 ?v3 )
	     (pred_1 ?v3)
             (pred_10 ?v8)
             (pred_5 ?v12)
             (pred_12 ?v7)
             (pred_11 ?v3)
             (pred_6 ?v12)
             (pred_7 ?v3)
             (pred_4 ))



(:action op_4
:parameters (?v2 ?v1 ?v4 ?v6)
:precondition (and (pred_10 ?v2) (pred_10 ?v1) (pred_5 ?v4) (pred_12 ?v6)
          (pred_3 ?v2 ?v1) (pred_8 ?v4 ?v6)
                   (pred_9 ?v1 ?v6) (pred_1 ?v2) 
                   (pred_11 ?v1) (pred_6 ?v4))
:effect (and  (pred_7 ?v1) (not (pred_11 ?v1))))


(:action op_2
:parameters (?v2 ?v9)
:precondition (and (pred_10 ?v2) (pred_10 ?v9)
               (pred_1 ?v2) (pred_3 ?v2 ?v9) (pred_7 ?v9))
:effect (and (pred_1 ?v9) (not (pred_1 ?v2))))

(:action op_1
:parameters (?v2 ?v4)
:precondition (and (pred_10 ?v2) (pred_5 ?v4) 
                  (pred_1 ?v2) (pred_2 ?v4 ?v2) (pred_4 ))
:effect (and (pred_6 ?v4)
   (not (pred_2 ?v4 ?v2)) (not (pred_4 ))))


(:action op_3
:parameters (?v2 ?v13 ?v10)
:precondition (and (pred_10 ?v2) (pred_5 ?v13) (pred_5 ?v10)
                  (pred_1 ?v2) (pred_6 ?v10) (pred_2 ?v13 ?v2))
:effect (and (pred_6 ?v13) (pred_2 ?v10 ?v2)
        (not (pred_6 ?v10)) (not (pred_2 ?v13 ?v2))))

(:action op_5
:parameters (?v2 ?v4)
:precondition (and (pred_10 ?v2) (pred_5 ?v4) 
                  (pred_1 ?v2) (pred_6 ?v4))
:effect (and (pred_4 ) (pred_2 ?v4 ?v2) (not (pred_6 ?v4)))))


	
