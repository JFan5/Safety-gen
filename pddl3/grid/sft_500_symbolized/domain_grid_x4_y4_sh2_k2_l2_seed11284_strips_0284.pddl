(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v9 ?v6)
             (pred_9 ?v3 ?v8)
             (pred_5 ?v9 ?v8)
             (pred_12 ?v11 ?v9 )
	     (pred_7 ?v9)
             (pred_6 ?v12)
             (pred_10 ?v3)
             (pred_3 ?v8)
             (pred_11 ?v9)
             (pred_4 ?v3)
             (pred_1 ?v9)
             (pred_2 ))



(:action op_2
:parameters (?v13 ?v1 ?v4 ?v7)
:precondition (and (pred_6 ?v13) (pred_6 ?v1) (pred_10 ?v4) (pred_3 ?v7)
          (pred_8 ?v13 ?v1) (pred_9 ?v4 ?v7)
                   (pred_5 ?v1 ?v7) (pred_7 ?v13) 
                   (pred_11 ?v1) (pred_4 ?v4))
:effect (and  (pred_1 ?v1) (not (pred_11 ?v1))))


(:action op_5
:parameters (?v13 ?v2)
:precondition (and (pred_6 ?v13) (pred_6 ?v2)
               (pred_7 ?v13) (pred_8 ?v13 ?v2) (pred_1 ?v2))
:effect (and (pred_7 ?v2) (not (pred_7 ?v13))))

(:action op_4
:parameters (?v13 ?v4)
:precondition (and (pred_6 ?v13) (pred_10 ?v4) 
                  (pred_7 ?v13) (pred_12 ?v4 ?v13) (pred_2 ))
:effect (and (pred_4 ?v4)
   (not (pred_12 ?v4 ?v13)) (not (pred_2 ))))


(:action op_3
:parameters (?v13 ?v10 ?v5)
:precondition (and (pred_6 ?v13) (pred_10 ?v10) (pred_10 ?v5)
                  (pred_7 ?v13) (pred_4 ?v5) (pred_12 ?v10 ?v13))
:effect (and (pred_4 ?v10) (pred_12 ?v5 ?v13)
        (not (pred_4 ?v5)) (not (pred_12 ?v10 ?v13))))

(:action op_1
:parameters (?v13 ?v4)
:precondition (and (pred_6 ?v13) (pred_10 ?v4) 
                  (pred_7 ?v13) (pred_4 ?v4))
:effect (and (pred_2 ) (pred_12 ?v4 ?v13) (not (pred_4 ?v4)))))


	
