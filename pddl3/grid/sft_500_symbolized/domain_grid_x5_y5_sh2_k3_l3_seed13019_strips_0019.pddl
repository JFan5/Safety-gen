(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v8 ?v12)
             (pred_11 ?v7 ?v6)
             (pred_12 ?v8 ?v6)
             (pred_10 ?v11 ?v8 )
	     (pred_3 ?v8)
             (pred_6 ?v9)
             (pred_7 ?v7)
             (pred_1 ?v6)
             (pred_2 ?v8)
             (pred_4 ?v7)
             (pred_9 ?v8)
             (pred_8 ))



(:action op_4
:parameters (?v1 ?v10 ?v4 ?v5)
:precondition (and (pred_6 ?v1) (pred_6 ?v10) (pred_7 ?v4) (pred_1 ?v5)
          (pred_5 ?v1 ?v10) (pred_11 ?v4 ?v5)
                   (pred_12 ?v10 ?v5) (pred_3 ?v1) 
                   (pred_2 ?v10) (pred_4 ?v4))
:effect (and  (pred_9 ?v10) (not (pred_2 ?v10))))


(:action op_5
:parameters (?v1 ?v3)
:precondition (and (pred_6 ?v1) (pred_6 ?v3)
               (pred_3 ?v1) (pred_5 ?v1 ?v3) (pred_9 ?v3))
:effect (and (pred_3 ?v3) (not (pred_3 ?v1))))

(:action op_2
:parameters (?v1 ?v4)
:precondition (and (pred_6 ?v1) (pred_7 ?v4) 
                  (pred_3 ?v1) (pred_10 ?v4 ?v1) (pred_8 ))
:effect (and (pred_4 ?v4)
   (not (pred_10 ?v4 ?v1)) (not (pred_8 ))))


(:action op_3
:parameters (?v1 ?v2 ?v13)
:precondition (and (pred_6 ?v1) (pred_7 ?v2) (pred_7 ?v13)
                  (pred_3 ?v1) (pred_4 ?v13) (pred_10 ?v2 ?v1))
:effect (and (pred_4 ?v2) (pred_10 ?v13 ?v1)
        (not (pred_4 ?v13)) (not (pred_10 ?v2 ?v1))))

(:action op_1
:parameters (?v1 ?v4)
:precondition (and (pred_6 ?v1) (pred_7 ?v4) 
                  (pred_3 ?v1) (pred_4 ?v4))
:effect (and (pred_8 ) (pred_10 ?v4 ?v1) (not (pred_4 ?v4)))))


	
