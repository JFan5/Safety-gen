(define (problem grid-2-2-1-1-1)
    (:domain grid)
    (:objects
    obj_05 obj_06 obj_03 obj_02
    obj_04
    obj_01
    )

    (:init
       (pred_4)

       (pred_2 obj_05)
       (pred_2 obj_06)
       (pred_2 obj_03)
       (pred_2 obj_02)
       (pred_5 obj_04)
       (pred_3 obj_01)

       (pred_6 obj_05 obj_03)
       (pred_6 obj_05 obj_06)
       (pred_6 obj_06 obj_02)
       (pred_6 obj_06 obj_05)
       (pred_6 obj_03 obj_02)
       (pred_6 obj_03 obj_05)
       (pred_6 obj_02 obj_06)
       (pred_6 obj_02 obj_03)
       (pred_7 obj_05)
       (pred_10  obj_05 obj_04)
       (pred_1 obj_06)
       (pred_1 obj_03)
       (pred_1 obj_02)

       (pred_12  obj_01 obj_04)
       (pred_8 obj_01 obj_02)
       (pred_11 obj_03)
    )

    (:goal (and
       (pred_8 obj_01 obj_05)
    ))
(:constraints
  (always (not (pred_11 obj_06)))
)
)