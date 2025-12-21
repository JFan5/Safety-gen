(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v6 ?v4)
             (pred_1 ?v12 ?v1)
             (pred_6 ?v6 ?v1)
             (pred_3 ?v2 ?v6 )
	     (pred_8 ?v6)
             (pred_10 ?v3)
             (pred_2 ?v12)
             (pred_7 ?v1)
             (pred_4 ?v6)
             (pred_9 ?v12)
             (pred_5 ?v6)
             (pred_11 ))



(:action op_4
:parameters (?v11 ?v5 ?v8 ?v10)
:precondition (and (pred_10 ?v11) (pred_10 ?v5) (pred_2 ?v8) (pred_7 ?v10)
          (pred_12 ?v11 ?v5) (pred_1 ?v8 ?v10)
                   (pred_6 ?v5 ?v10) (pred_8 ?v11) 
                   (pred_4 ?v5) (pred_9 ?v8))
:effect (and  (pred_5 ?v5) (not (pred_4 ?v5))))


(:action op_1
:parameters (?v11 ?v7)
:precondition (and (pred_10 ?v11) (pred_10 ?v7)
               (pred_8 ?v11) (pred_12 ?v11 ?v7) (pred_5 ?v7))
:effect (and (pred_8 ?v7) (not (pred_8 ?v11))))

(:action op_3
:parameters (?v11 ?v8)
:precondition (and (pred_10 ?v11) (pred_2 ?v8) 
                  (pred_8 ?v11) (pred_3 ?v8 ?v11) (pred_11 ))
:effect (and (pred_9 ?v8)
   (not (pred_3 ?v8 ?v11)) (not (pred_11 ))))


(:action op_2
:parameters (?v11 ?v9 ?v13)
:precondition (and (pred_10 ?v11) (pred_2 ?v9) (pred_2 ?v13)
                  (pred_8 ?v11) (pred_9 ?v13) (pred_3 ?v9 ?v11))
:effect (and (pred_9 ?v9) (pred_3 ?v13 ?v11)
        (not (pred_9 ?v13)) (not (pred_3 ?v9 ?v11))))

(:action op_5
:parameters (?v11 ?v8)
:precondition (and (pred_10 ?v11) (pred_2 ?v8) 
                  (pred_8 ?v11) (pred_9 ?v8))
:effect (and (pred_11 ) (pred_3 ?v8 ?v11) (not (pred_9 ?v8)))))


	
