(define (problem grid-2-2-1-1-1)
    (:domain grid)
    (:objects
    obj_02 obj_05 obj_04 obj_01
    obj_03
    obj_06
    )

    (:init
       (pred_1)

       (pred_2 obj_02)
       (pred_2 obj_05)
       (pred_2 obj_04)
       (pred_2 obj_01)
       (pred_9 obj_03)
       (pred_4 obj_06)

       (pred_10 obj_02 obj_04)
       (pred_10 obj_02 obj_05)
       (pred_10 obj_05 obj_01)
       (pred_10 obj_05 obj_02)
       (pred_10 obj_04 obj_01)
       (pred_10 obj_04 obj_02)
       (pred_10 obj_01 obj_05)
       (pred_10 obj_01 obj_04)
       (pred_3 obj_01)
       (pred_6  obj_01 obj_03)
       (pred_11 obj_02)
       (pred_11 obj_05)
       (pred_11 obj_04)

       (pred_8  obj_06 obj_03)
       (pred_12 obj_06 obj_04)
       (pred_5 obj_04)
    )

    (:goal (and
       (pred_12 obj_06 obj_01)
    ))
(:constraints
  (always (not (pred_5 obj_05)))
)
)