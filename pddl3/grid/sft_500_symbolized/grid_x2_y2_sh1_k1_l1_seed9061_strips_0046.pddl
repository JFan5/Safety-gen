(define (problem grid-2-2-1-1-1)
    (:domain grid)
    (:objects
    obj_03 obj_02 obj_05 obj_06
    obj_01
    obj_04
    )

    (:init
       (pred_5)

       (pred_11 obj_03)
       (pred_11 obj_02)
       (pred_11 obj_05)
       (pred_11 obj_06)
       (pred_4 obj_01)
       (pred_6 obj_04)

       (pred_7 obj_03 obj_05)
       (pred_7 obj_03 obj_02)
       (pred_7 obj_02 obj_06)
       (pred_7 obj_02 obj_03)
       (pred_7 obj_05 obj_06)
       (pred_7 obj_05 obj_03)
       (pred_7 obj_06 obj_02)
       (pred_7 obj_06 obj_05)
       (pred_1 obj_03)
       (pred_3  obj_03 obj_01)
       (pred_10 obj_02)
       (pred_10 obj_05)
       (pred_10 obj_06)

       (pred_12  obj_04 obj_01)
       (pred_9 obj_04 obj_06)
       (pred_8 obj_05)
    )

    (:goal (and
       (pred_9 obj_04 obj_03)
    ))
(:constraints
  (always (not (pred_8 obj_02)))
)
)