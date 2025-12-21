(define (problem grid-2-2-1-1-1)
    (:domain grid)
    (:objects
    obj_03 obj_06 obj_02 obj_05
    obj_01
    obj_04
    )

    (:init
       (pred_3)

       (pred_5 obj_03)
       (pred_5 obj_06)
       (pred_5 obj_02)
       (pred_5 obj_05)
       (pred_8 obj_01)
       (pred_9 obj_04)

       (pred_6 obj_03 obj_02)
       (pred_6 obj_03 obj_06)
       (pred_6 obj_06 obj_05)
       (pred_6 obj_06 obj_03)
       (pred_6 obj_02 obj_05)
       (pred_6 obj_02 obj_03)
       (pred_6 obj_05 obj_06)
       (pred_6 obj_05 obj_02)
       (pred_11 obj_05)
       (pred_2  obj_05 obj_01)
       (pred_10 obj_03)
       (pred_10 obj_06)
       (pred_10 obj_02)

       (pred_1  obj_04 obj_01)
       (pred_7 obj_04 obj_03)
       (pred_12 obj_02)
    )

    (:goal (and
       (pred_7 obj_04 obj_05)
    ))
(:constraints
  (always (not (pred_12 obj_06)))
)
)