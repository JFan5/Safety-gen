(define (problem grid-2-2-1-1-1)
    (:domain grid)
    (:objects
    obj_05 obj_04 obj_01 obj_02
    obj_03
    obj_06
    )

    (:init
       (pred_6)

       (pred_2 obj_05)
       (pred_2 obj_04)
       (pred_2 obj_01)
       (pred_2 obj_02)
       (pred_3 obj_03)
       (pred_1 obj_06)

       (pred_9 obj_05 obj_01)
       (pred_9 obj_05 obj_04)
       (pred_9 obj_04 obj_02)
       (pred_9 obj_04 obj_05)
       (pred_9 obj_01 obj_02)
       (pred_9 obj_01 obj_05)
       (pred_9 obj_02 obj_04)
       (pred_9 obj_02 obj_01)
       (pred_7 obj_02)
       (pred_12  obj_02 obj_03)
       (pred_4 obj_05)
       (pred_4 obj_04)
       (pred_4 obj_01)

       (pred_11  obj_06 obj_03)
       (pred_5 obj_06 obj_05)
       (pred_10 obj_05)
    )

    (:goal (and
       (pred_5 obj_06 obj_02)
    ))
(:constraints
  (always (not (pred_10 obj_04)))
)
)