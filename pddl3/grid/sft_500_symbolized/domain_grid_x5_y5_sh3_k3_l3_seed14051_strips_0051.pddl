(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v12 ?v2)
             (pred_4 ?v11 ?v4)
             (pred_7 ?v12 ?v4)
             (pred_12 ?v1 ?v12 )
	     (pred_11 ?v12)
             (pred_6 ?v9)
             (pred_1 ?v11)
             (pred_2 ?v4)
             (pred_8 ?v12)
             (pred_9 ?v11)
             (pred_10 ?v12)
             (pred_5 ))



(:action op_4
:parameters (?v13 ?v5 ?v6 ?v10)
:precondition (and (pred_6 ?v13) (pred_6 ?v5) (pred_1 ?v6) (pred_2 ?v10)
          (pred_3 ?v13 ?v5) (pred_4 ?v6 ?v10)
                   (pred_7 ?v5 ?v10) (pred_11 ?v13) 
                   (pred_8 ?v5) (pred_9 ?v6))
:effect (and  (pred_10 ?v5) (not (pred_8 ?v5))))


(:action op_2
:parameters (?v13 ?v7)
:precondition (and (pred_6 ?v13) (pred_6 ?v7)
               (pred_11 ?v13) (pred_3 ?v13 ?v7) (pred_10 ?v7))
:effect (and (pred_11 ?v7) (not (pred_11 ?v13))))

(:action op_1
:parameters (?v13 ?v6)
:precondition (and (pred_6 ?v13) (pred_1 ?v6) 
                  (pred_11 ?v13) (pred_12 ?v6 ?v13) (pred_5 ))
:effect (and (pred_9 ?v6)
   (not (pred_12 ?v6 ?v13)) (not (pred_5 ))))


(:action op_3
:parameters (?v13 ?v8 ?v3)
:precondition (and (pred_6 ?v13) (pred_1 ?v8) (pred_1 ?v3)
                  (pred_11 ?v13) (pred_9 ?v3) (pred_12 ?v8 ?v13))
:effect (and (pred_9 ?v8) (pred_12 ?v3 ?v13)
        (not (pred_9 ?v3)) (not (pred_12 ?v8 ?v13))))

(:action op_5
:parameters (?v13 ?v6)
:precondition (and (pred_6 ?v13) (pred_1 ?v6) 
                  (pred_11 ?v13) (pred_9 ?v6))
:effect (and (pred_5 ) (pred_12 ?v6 ?v13) (not (pred_9 ?v6)))))


	
