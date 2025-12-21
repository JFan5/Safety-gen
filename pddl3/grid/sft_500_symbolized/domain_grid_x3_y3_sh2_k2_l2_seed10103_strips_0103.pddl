(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v3 ?v1)
             (pred_8 ?v8 ?v12)
             (pred_7 ?v3 ?v12)
             (pred_4 ?v7 ?v3 )
	     (pred_11 ?v3)
             (pred_3 ?v2)
             (pred_1 ?v8)
             (pred_12 ?v12)
             (pred_10 ?v3)
             (pred_6 ?v8)
             (pred_2 ?v3)
             (pred_5 ))



(:action op_3
:parameters (?v11 ?v6 ?v10 ?v9)
:precondition (and (pred_3 ?v11) (pred_3 ?v6) (pred_1 ?v10) (pred_12 ?v9)
          (pred_9 ?v11 ?v6) (pred_8 ?v10 ?v9)
                   (pred_7 ?v6 ?v9) (pred_11 ?v11) 
                   (pred_10 ?v6) (pred_6 ?v10))
:effect (and  (pred_2 ?v6) (not (pred_10 ?v6))))


(:action op_5
:parameters (?v11 ?v5)
:precondition (and (pred_3 ?v11) (pred_3 ?v5)
               (pred_11 ?v11) (pred_9 ?v11 ?v5) (pred_2 ?v5))
:effect (and (pred_11 ?v5) (not (pred_11 ?v11))))

(:action op_1
:parameters (?v11 ?v10)
:precondition (and (pred_3 ?v11) (pred_1 ?v10) 
                  (pred_11 ?v11) (pred_4 ?v10 ?v11) (pred_5 ))
:effect (and (pred_6 ?v10)
   (not (pred_4 ?v10 ?v11)) (not (pred_5 ))))


(:action op_2
:parameters (?v11 ?v13 ?v4)
:precondition (and (pred_3 ?v11) (pred_1 ?v13) (pred_1 ?v4)
                  (pred_11 ?v11) (pred_6 ?v4) (pred_4 ?v13 ?v11))
:effect (and (pred_6 ?v13) (pred_4 ?v4 ?v11)
        (not (pred_6 ?v4)) (not (pred_4 ?v13 ?v11))))

(:action op_4
:parameters (?v11 ?v10)
:precondition (and (pred_3 ?v11) (pred_1 ?v10) 
                  (pred_11 ?v11) (pred_6 ?v10))
:effect (and (pred_5 ) (pred_4 ?v10 ?v11) (not (pred_6 ?v10)))))


	
