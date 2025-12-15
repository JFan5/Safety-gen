(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v3 ?v10)
             (pred_1 ?v9 ?v8)
             (pred_2 ?v3 ?v8)
             (pred_11 ?v6 ?v3 )
	     (pred_7 ?v3)
             (pred_10 ?v2)
             (pred_9 ?v9)
             (pred_8 ?v8)
             (pred_12 ?v3)
             (pred_4 ?v9)
             (pred_5 ?v3)
             (pred_3 ))



(:action op_4
:parameters (?v11 ?v13 ?v12 ?v5)
:precondition (and (pred_10 ?v11) (pred_10 ?v13) (pred_9 ?v12) (pred_8 ?v5)
          (pred_6 ?v11 ?v13) (pred_1 ?v12 ?v5)
                   (pred_2 ?v13 ?v5) (pred_7 ?v11) 
                   (pred_12 ?v13) (pred_4 ?v12))
:effect (and  (pred_5 ?v13) (not (pred_12 ?v13))))


(:action op_2
:parameters (?v11 ?v4)
:precondition (and (pred_10 ?v11) (pred_10 ?v4)
               (pred_7 ?v11) (pred_6 ?v11 ?v4) (pred_5 ?v4))
:effect (and (pred_7 ?v4) (not (pred_7 ?v11))))

(:action op_5
:parameters (?v11 ?v12)
:precondition (and (pred_10 ?v11) (pred_9 ?v12) 
                  (pred_7 ?v11) (pred_11 ?v12 ?v11) (pred_3 ))
:effect (and (pred_4 ?v12)
   (not (pred_11 ?v12 ?v11)) (not (pred_3 ))))


(:action op_3
:parameters (?v11 ?v7 ?v1)
:precondition (and (pred_10 ?v11) (pred_9 ?v7) (pred_9 ?v1)
                  (pred_7 ?v11) (pred_4 ?v1) (pred_11 ?v7 ?v11))
:effect (and (pred_4 ?v7) (pred_11 ?v1 ?v11)
        (not (pred_4 ?v1)) (not (pred_11 ?v7 ?v11))))

(:action op_1
:parameters (?v11 ?v12)
:precondition (and (pred_10 ?v11) (pred_9 ?v12) 
                  (pred_7 ?v11) (pred_4 ?v12))
:effect (and (pred_3 ) (pred_11 ?v12 ?v11) (not (pred_4 ?v12)))))


	
