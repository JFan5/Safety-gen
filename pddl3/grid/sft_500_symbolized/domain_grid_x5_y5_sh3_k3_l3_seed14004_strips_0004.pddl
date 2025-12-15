(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v9 ?v1)
             (pred_8 ?v10 ?v2)
             (pred_4 ?v9 ?v2)
             (pred_10 ?v7 ?v9 )
	     (pred_3 ?v9)
             (pred_6 ?v11)
             (pred_11 ?v10)
             (pred_5 ?v2)
             (pred_12 ?v9)
             (pred_9 ?v10)
             (pred_7 ?v9)
             (pred_2 ))



(:action op_3
:parameters (?v13 ?v3 ?v4 ?v5)
:precondition (and (pred_6 ?v13) (pred_6 ?v3) (pred_11 ?v4) (pred_5 ?v5)
          (pred_1 ?v13 ?v3) (pred_8 ?v4 ?v5)
                   (pred_4 ?v3 ?v5) (pred_3 ?v13) 
                   (pred_12 ?v3) (pred_9 ?v4))
:effect (and  (pred_7 ?v3) (not (pred_12 ?v3))))


(:action op_1
:parameters (?v13 ?v8)
:precondition (and (pred_6 ?v13) (pred_6 ?v8)
               (pred_3 ?v13) (pred_1 ?v13 ?v8) (pred_7 ?v8))
:effect (and (pred_3 ?v8) (not (pred_3 ?v13))))

(:action op_4
:parameters (?v13 ?v4)
:precondition (and (pred_6 ?v13) (pred_11 ?v4) 
                  (pred_3 ?v13) (pred_10 ?v4 ?v13) (pred_2 ))
:effect (and (pred_9 ?v4)
   (not (pred_10 ?v4 ?v13)) (not (pred_2 ))))


(:action op_2
:parameters (?v13 ?v12 ?v6)
:precondition (and (pred_6 ?v13) (pred_11 ?v12) (pred_11 ?v6)
                  (pred_3 ?v13) (pred_9 ?v6) (pred_10 ?v12 ?v13))
:effect (and (pred_9 ?v12) (pred_10 ?v6 ?v13)
        (not (pred_9 ?v6)) (not (pred_10 ?v12 ?v13))))

(:action op_5
:parameters (?v13 ?v4)
:precondition (and (pred_6 ?v13) (pred_11 ?v4) 
                  (pred_3 ?v13) (pred_9 ?v4))
:effect (and (pred_2 ) (pred_10 ?v4 ?v13) (not (pred_9 ?v4)))))


	
