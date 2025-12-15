(define (problem grid-2-2-1-1-1)
    (:domain grid)
    (:objects
    obj_05 obj_04 obj_01 obj_06
    obj_02
    obj_03
    )

    (:init
       (pred_9)

       (pred_11 obj_05)
       (pred_11 obj_04)
       (pred_11 obj_01)
       (pred_11 obj_06)
       (pred_4 obj_02)
       (pred_2 obj_03)

       (pred_12 obj_05 obj_01)
       (pred_12 obj_05 obj_04)
       (pred_12 obj_04 obj_06)
       (pred_12 obj_04 obj_05)
       (pred_12 obj_01 obj_06)
       (pred_12 obj_01 obj_05)
       (pred_12 obj_06 obj_04)
       (pred_12 obj_06 obj_01)
       (pred_5 obj_01)
       (pred_6  obj_01 obj_02)
       (pred_7 obj_05)
       (pred_7 obj_04)
       (pred_7 obj_06)

       (pred_8  obj_03 obj_02)
       (pred_10 obj_03 obj_04)
       (pred_1 obj_04)
    )

    (:goal (and
       (pred_10 obj_03 obj_01)
    ))
(:constraints
  (always (not (pred_1 obj_05)))
)
)