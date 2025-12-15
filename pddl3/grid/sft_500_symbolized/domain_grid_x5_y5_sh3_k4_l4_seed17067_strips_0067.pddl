(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v11 ?v7)
             (pred_3 ?v10 ?v5)
             (pred_12 ?v11 ?v5)
             (pred_6 ?v2 ?v11 )
	     (pred_8 ?v11)
             (pred_10 ?v9)
             (pred_9 ?v10)
             (pred_4 ?v5)
             (pred_5 ?v11)
             (pred_1 ?v10)
             (pred_2 ?v11)
             (pred_11 ))



(:action op_4
:parameters (?v13 ?v12 ?v6 ?v4)
:precondition (and (pred_10 ?v13) (pred_10 ?v12) (pred_9 ?v6) (pred_4 ?v4)
          (pred_7 ?v13 ?v12) (pred_3 ?v6 ?v4)
                   (pred_12 ?v12 ?v4) (pred_8 ?v13) 
                   (pred_5 ?v12) (pred_1 ?v6))
:effect (and  (pred_2 ?v12) (not (pred_5 ?v12))))


(:action op_3
:parameters (?v13 ?v1)
:precondition (and (pred_10 ?v13) (pred_10 ?v1)
               (pred_8 ?v13) (pred_7 ?v13 ?v1) (pred_2 ?v1))
:effect (and (pred_8 ?v1) (not (pred_8 ?v13))))

(:action op_1
:parameters (?v13 ?v6)
:precondition (and (pred_10 ?v13) (pred_9 ?v6) 
                  (pred_8 ?v13) (pred_6 ?v6 ?v13) (pred_11 ))
:effect (and (pred_1 ?v6)
   (not (pred_6 ?v6 ?v13)) (not (pred_11 ))))


(:action op_2
:parameters (?v13 ?v3 ?v8)
:precondition (and (pred_10 ?v13) (pred_9 ?v3) (pred_9 ?v8)
                  (pred_8 ?v13) (pred_1 ?v8) (pred_6 ?v3 ?v13))
:effect (and (pred_1 ?v3) (pred_6 ?v8 ?v13)
        (not (pred_1 ?v8)) (not (pred_6 ?v3 ?v13))))

(:action op_5
:parameters (?v13 ?v6)
:precondition (and (pred_10 ?v13) (pred_9 ?v6) 
                  (pred_8 ?v13) (pred_1 ?v6))
:effect (and (pred_11 ) (pred_6 ?v6 ?v13) (not (pred_1 ?v6)))))


	
