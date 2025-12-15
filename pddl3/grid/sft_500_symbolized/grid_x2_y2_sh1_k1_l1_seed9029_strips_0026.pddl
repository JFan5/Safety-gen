(define (problem grid-2-2-1-1-1)
    (:domain grid)
    (:objects
    obj_02 obj_01 obj_05 obj_06
    obj_04
    obj_03
    )

    (:init
       (pred_10)

       (pred_5 obj_02)
       (pred_5 obj_01)
       (pred_5 obj_05)
       (pred_5 obj_06)
       (pred_9 obj_04)
       (pred_3 obj_03)

       (pred_12 obj_02 obj_05)
       (pred_12 obj_02 obj_01)
       (pred_12 obj_01 obj_06)
       (pred_12 obj_01 obj_02)
       (pred_12 obj_05 obj_06)
       (pred_12 obj_05 obj_02)
       (pred_12 obj_06 obj_01)
       (pred_12 obj_06 obj_05)
       (pred_11 obj_06)
       (pred_1  obj_06 obj_04)
       (pred_2 obj_02)
       (pred_2 obj_01)
       (pred_2 obj_05)

       (pred_7  obj_03 obj_04)
       (pred_8 obj_03 obj_02)
       (pred_4 obj_05)
    )

    (:goal (and
       (pred_8 obj_03 obj_06)
    ))
(:constraints
  (always (not (pred_4 obj_01)))
)
)