(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v2 ?v4)
             (pred_2 ?v5 ?v8)
             (pred_1 ?v2 ?v8)
             (pred_3 ?v9 ?v2 )
	     (pred_4 ?v2)
             (pred_9 ?v1)
             (pred_5 ?v5)
             (pred_6 ?v8)
             (pred_12 ?v2)
             (pred_11 ?v5)
             (pred_10 ?v2)
             (pred_8 ))



(:action op_1
:parameters (?v13 ?v6 ?v10 ?v12)
:precondition (and (pred_9 ?v13) (pred_9 ?v6) (pred_5 ?v10) (pred_6 ?v12)
          (pred_7 ?v13 ?v6) (pred_2 ?v10 ?v12)
                   (pred_1 ?v6 ?v12) (pred_4 ?v13) 
                   (pred_12 ?v6) (pred_11 ?v10))
:effect (and  (pred_10 ?v6) (not (pred_12 ?v6))))


(:action op_4
:parameters (?v13 ?v7)
:precondition (and (pred_9 ?v13) (pred_9 ?v7)
               (pred_4 ?v13) (pred_7 ?v13 ?v7) (pred_10 ?v7))
:effect (and (pred_4 ?v7) (not (pred_4 ?v13))))

(:action op_5
:parameters (?v13 ?v10)
:precondition (and (pred_9 ?v13) (pred_5 ?v10) 
                  (pred_4 ?v13) (pred_3 ?v10 ?v13) (pred_8 ))
:effect (and (pred_11 ?v10)
   (not (pred_3 ?v10 ?v13)) (not (pred_8 ))))


(:action op_2
:parameters (?v13 ?v3 ?v11)
:precondition (and (pred_9 ?v13) (pred_5 ?v3) (pred_5 ?v11)
                  (pred_4 ?v13) (pred_11 ?v11) (pred_3 ?v3 ?v13))
:effect (and (pred_11 ?v3) (pred_3 ?v11 ?v13)
        (not (pred_11 ?v11)) (not (pred_3 ?v3 ?v13))))

(:action op_3
:parameters (?v13 ?v10)
:precondition (and (pred_9 ?v13) (pred_5 ?v10) 
                  (pred_4 ?v13) (pred_11 ?v10))
:effect (and (pred_8 ) (pred_3 ?v10 ?v13) (not (pred_11 ?v10)))))


	
