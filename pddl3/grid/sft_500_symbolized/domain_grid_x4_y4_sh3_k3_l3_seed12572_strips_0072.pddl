(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v2 ?v7)
             (pred_8 ?v10 ?v9)
             (pred_12 ?v2 ?v9)
             (pred_4 ?v4 ?v2 )
	     (pred_1 ?v2)
             (pred_2 ?v5)
             (pred_3 ?v10)
             (pred_6 ?v9)
             (pred_7 ?v2)
             (pred_10 ?v10)
             (pred_5 ?v2)
             (pred_11 ))



(:action op_5
:parameters (?v11 ?v6 ?v3 ?v8)
:precondition (and (pred_2 ?v11) (pred_2 ?v6) (pred_3 ?v3) (pred_6 ?v8)
          (pred_9 ?v11 ?v6) (pred_8 ?v3 ?v8)
                   (pred_12 ?v6 ?v8) (pred_1 ?v11) 
                   (pred_7 ?v6) (pred_10 ?v3))
:effect (and  (pred_5 ?v6) (not (pred_7 ?v6))))


(:action op_2
:parameters (?v11 ?v13)
:precondition (and (pred_2 ?v11) (pred_2 ?v13)
               (pred_1 ?v11) (pred_9 ?v11 ?v13) (pred_5 ?v13))
:effect (and (pred_1 ?v13) (not (pred_1 ?v11))))

(:action op_4
:parameters (?v11 ?v3)
:precondition (and (pred_2 ?v11) (pred_3 ?v3) 
                  (pred_1 ?v11) (pred_4 ?v3 ?v11) (pred_11 ))
:effect (and (pred_10 ?v3)
   (not (pred_4 ?v3 ?v11)) (not (pred_11 ))))


(:action op_3
:parameters (?v11 ?v1 ?v12)
:precondition (and (pred_2 ?v11) (pred_3 ?v1) (pred_3 ?v12)
                  (pred_1 ?v11) (pred_10 ?v12) (pred_4 ?v1 ?v11))
:effect (and (pred_10 ?v1) (pred_4 ?v12 ?v11)
        (not (pred_10 ?v12)) (not (pred_4 ?v1 ?v11))))

(:action op_1
:parameters (?v11 ?v3)
:precondition (and (pred_2 ?v11) (pred_3 ?v3) 
                  (pred_1 ?v11) (pred_10 ?v3))
:effect (and (pred_11 ) (pred_4 ?v3 ?v11) (not (pred_10 ?v3)))))


	
