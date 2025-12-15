(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v9 ?v11)
             (pred_1 ?v4 ?v12)
             (pred_4 ?v9 ?v12)
             (pred_3 ?v10 ?v9 )
	     (pred_11 ?v9)
             (pred_8 ?v7)
             (pred_2 ?v4)
             (pred_7 ?v12)
             (pred_6 ?v9)
             (pred_5 ?v4)
             (pred_10 ?v9)
             (pred_12 ))



(:action op_5
:parameters (?v13 ?v3 ?v5 ?v8)
:precondition (and (pred_8 ?v13) (pred_8 ?v3) (pred_2 ?v5) (pred_7 ?v8)
          (pred_9 ?v13 ?v3) (pred_1 ?v5 ?v8)
                   (pred_4 ?v3 ?v8) (pred_11 ?v13) 
                   (pred_6 ?v3) (pred_5 ?v5))
:effect (and  (pred_10 ?v3) (not (pred_6 ?v3))))


(:action op_4
:parameters (?v13 ?v6)
:precondition (and (pred_8 ?v13) (pred_8 ?v6)
               (pred_11 ?v13) (pred_9 ?v13 ?v6) (pred_10 ?v6))
:effect (and (pred_11 ?v6) (not (pred_11 ?v13))))

(:action op_3
:parameters (?v13 ?v5)
:precondition (and (pred_8 ?v13) (pred_2 ?v5) 
                  (pred_11 ?v13) (pred_3 ?v5 ?v13) (pred_12 ))
:effect (and (pred_5 ?v5)
   (not (pred_3 ?v5 ?v13)) (not (pred_12 ))))


(:action op_1
:parameters (?v13 ?v2 ?v1)
:precondition (and (pred_8 ?v13) (pred_2 ?v2) (pred_2 ?v1)
                  (pred_11 ?v13) (pred_5 ?v1) (pred_3 ?v2 ?v13))
:effect (and (pred_5 ?v2) (pred_3 ?v1 ?v13)
        (not (pred_5 ?v1)) (not (pred_3 ?v2 ?v13))))

(:action op_2
:parameters (?v13 ?v5)
:precondition (and (pred_8 ?v13) (pred_2 ?v5) 
                  (pred_11 ?v13) (pred_5 ?v5))
:effect (and (pred_12 ) (pred_3 ?v5 ?v13) (not (pred_5 ?v5)))))


	
