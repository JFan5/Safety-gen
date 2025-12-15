(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v5 ?v12)
             (pred_4 ?v4 ?v11)
             (pred_8 ?v5 ?v11)
             (pred_11 ?v9 ?v5 )
	     (pred_10 ?v5)
             (pred_6 ?v1)
             (pred_12 ?v4)
             (pred_2 ?v11)
             (pred_5 ?v5)
             (pred_7 ?v4)
             (pred_3 ?v5)
             (pred_1 ))



(:action op_4
:parameters (?v13 ?v2 ?v6 ?v7)
:precondition (and (pred_6 ?v13) (pred_6 ?v2) (pred_12 ?v6) (pred_2 ?v7)
          (pred_9 ?v13 ?v2) (pred_4 ?v6 ?v7)
                   (pred_8 ?v2 ?v7) (pred_10 ?v13) 
                   (pred_5 ?v2) (pred_7 ?v6))
:effect (and  (pred_3 ?v2) (not (pred_5 ?v2))))


(:action op_5
:parameters (?v13 ?v3)
:precondition (and (pred_6 ?v13) (pred_6 ?v3)
               (pred_10 ?v13) (pred_9 ?v13 ?v3) (pred_3 ?v3))
:effect (and (pred_10 ?v3) (not (pred_10 ?v13))))

(:action op_2
:parameters (?v13 ?v6)
:precondition (and (pred_6 ?v13) (pred_12 ?v6) 
                  (pred_10 ?v13) (pred_11 ?v6 ?v13) (pred_1 ))
:effect (and (pred_7 ?v6)
   (not (pred_11 ?v6 ?v13)) (not (pred_1 ))))


(:action op_3
:parameters (?v13 ?v8 ?v10)
:precondition (and (pred_6 ?v13) (pred_12 ?v8) (pred_12 ?v10)
                  (pred_10 ?v13) (pred_7 ?v10) (pred_11 ?v8 ?v13))
:effect (and (pred_7 ?v8) (pred_11 ?v10 ?v13)
        (not (pred_7 ?v10)) (not (pred_11 ?v8 ?v13))))

(:action op_1
:parameters (?v13 ?v6)
:precondition (and (pred_6 ?v13) (pred_12 ?v6) 
                  (pred_10 ?v13) (pred_7 ?v6))
:effect (and (pred_1 ) (pred_11 ?v6 ?v13) (not (pred_7 ?v6)))))


	
