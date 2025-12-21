(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v11 ?v4)
             (pred_2 ?v7 ?v13)
             (pred_1 ?v11 ?v13)
             (pred_4 ?v12 ?v11 )
	     (pred_3 ?v11)
             (pred_8 ?v5)
             (pred_6 ?v7)
             (pred_9 ?v13)
             (pred_10 ?v11)
             (pred_7 ?v7)
             (pred_5 ?v11)
             (pred_11 ))



(:action op_2
:parameters (?v9 ?v1 ?v6 ?v8)
:precondition (and (pred_8 ?v9) (pred_8 ?v1) (pred_6 ?v6) (pred_9 ?v8)
          (pred_12 ?v9 ?v1) (pred_2 ?v6 ?v8)
                   (pred_1 ?v1 ?v8) (pred_3 ?v9) 
                   (pred_10 ?v1) (pred_7 ?v6))
:effect (and  (pred_5 ?v1) (not (pred_10 ?v1))))


(:action op_1
:parameters (?v9 ?v10)
:precondition (and (pred_8 ?v9) (pred_8 ?v10)
               (pred_3 ?v9) (pred_12 ?v9 ?v10) (pred_5 ?v10))
:effect (and (pred_3 ?v10) (not (pred_3 ?v9))))

(:action op_4
:parameters (?v9 ?v6)
:precondition (and (pred_8 ?v9) (pred_6 ?v6) 
                  (pred_3 ?v9) (pred_4 ?v6 ?v9) (pred_11 ))
:effect (and (pred_7 ?v6)
   (not (pred_4 ?v6 ?v9)) (not (pred_11 ))))


(:action op_3
:parameters (?v9 ?v3 ?v2)
:precondition (and (pred_8 ?v9) (pred_6 ?v3) (pred_6 ?v2)
                  (pred_3 ?v9) (pred_7 ?v2) (pred_4 ?v3 ?v9))
:effect (and (pred_7 ?v3) (pred_4 ?v2 ?v9)
        (not (pred_7 ?v2)) (not (pred_4 ?v3 ?v9))))

(:action op_5
:parameters (?v9 ?v6)
:precondition (and (pred_8 ?v9) (pred_6 ?v6) 
                  (pred_3 ?v9) (pred_7 ?v6))
:effect (and (pred_11 ) (pred_4 ?v6 ?v9) (not (pred_7 ?v6)))))


	
