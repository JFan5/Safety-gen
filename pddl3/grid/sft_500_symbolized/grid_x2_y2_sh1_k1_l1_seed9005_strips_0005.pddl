(define (problem grid-2-2-1-1-1)
    (:domain grid)
    (:objects
    obj_06 obj_03 obj_02 obj_04
    obj_05
    obj_01
    )

    (:init
       (pred_8)

       (pred_10 obj_06)
       (pred_10 obj_03)
       (pred_10 obj_02)
       (pred_10 obj_04)
       (pred_2 obj_05)
       (pred_1 obj_01)

       (pred_9 obj_06 obj_02)
       (pred_9 obj_06 obj_03)
       (pred_9 obj_03 obj_04)
       (pred_9 obj_03 obj_06)
       (pred_9 obj_02 obj_04)
       (pred_9 obj_02 obj_06)
       (pred_9 obj_04 obj_03)
       (pred_9 obj_04 obj_02)
       (pred_12 obj_02)
       (pred_3  obj_02 obj_05)
       (pred_6 obj_06)
       (pred_6 obj_03)
       (pred_6 obj_04)

       (pred_4  obj_01 obj_05)
       (pred_7 obj_01 obj_03)
       (pred_11 obj_03)
    )

    (:goal (and
       (pred_7 obj_01 obj_02)
    ))
(:constraints
  (always (not (pred_11 obj_06)))
)
)