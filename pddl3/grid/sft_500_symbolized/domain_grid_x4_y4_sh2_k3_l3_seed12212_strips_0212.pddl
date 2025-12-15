(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v9 ?v10)
             (pred_10 ?v5 ?v12)
             (pred_8 ?v9 ?v12)
             (pred_6 ?v7 ?v9 )
	     (pred_7 ?v9)
             (pred_4 ?v2)
             (pred_2 ?v5)
             (pred_12 ?v12)
             (pred_1 ?v9)
             (pred_9 ?v5)
             (pred_11 ?v9)
             (pred_5 ))



(:action op_3
:parameters (?v6 ?v13 ?v11 ?v1)
:precondition (and (pred_4 ?v6) (pred_4 ?v13) (pred_2 ?v11) (pred_12 ?v1)
          (pred_3 ?v6 ?v13) (pred_10 ?v11 ?v1)
                   (pred_8 ?v13 ?v1) (pred_7 ?v6) 
                   (pred_1 ?v13) (pred_9 ?v11))
:effect (and  (pred_11 ?v13) (not (pred_1 ?v13))))


(:action op_5
:parameters (?v6 ?v8)
:precondition (and (pred_4 ?v6) (pred_4 ?v8)
               (pred_7 ?v6) (pred_3 ?v6 ?v8) (pred_11 ?v8))
:effect (and (pred_7 ?v8) (not (pred_7 ?v6))))

(:action op_4
:parameters (?v6 ?v11)
:precondition (and (pred_4 ?v6) (pred_2 ?v11) 
                  (pred_7 ?v6) (pred_6 ?v11 ?v6) (pred_5 ))
:effect (and (pred_9 ?v11)
   (not (pred_6 ?v11 ?v6)) (not (pred_5 ))))


(:action op_1
:parameters (?v6 ?v4 ?v3)
:precondition (and (pred_4 ?v6) (pred_2 ?v4) (pred_2 ?v3)
                  (pred_7 ?v6) (pred_9 ?v3) (pred_6 ?v4 ?v6))
:effect (and (pred_9 ?v4) (pred_6 ?v3 ?v6)
        (not (pred_9 ?v3)) (not (pred_6 ?v4 ?v6))))

(:action op_2
:parameters (?v6 ?v11)
:precondition (and (pred_4 ?v6) (pred_2 ?v11) 
                  (pred_7 ?v6) (pred_9 ?v11))
:effect (and (pred_5 ) (pred_6 ?v11 ?v6) (not (pred_9 ?v11)))))


	
