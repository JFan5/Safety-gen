(define (problem grid-2-2-1-1-1)
    (:domain grid)
    (:objects
    obj_05 obj_06 obj_04 obj_03
    obj_01
    obj_02
    )

    (:init
       (pred_3)

       (pred_10 obj_05)
       (pred_10 obj_06)
       (pred_10 obj_04)
       (pred_10 obj_03)
       (pred_8 obj_01)
       (pred_9 obj_02)

       (pred_2 obj_05 obj_04)
       (pred_2 obj_05 obj_06)
       (pred_2 obj_06 obj_03)
       (pred_2 obj_06 obj_05)
       (pred_2 obj_04 obj_03)
       (pred_2 obj_04 obj_05)
       (pred_2 obj_03 obj_06)
       (pred_2 obj_03 obj_04)
       (pred_11 obj_03)
       (pred_6  obj_03 obj_01)
       (pred_5 obj_05)
       (pred_5 obj_06)
       (pred_5 obj_04)

       (pred_7  obj_02 obj_01)
       (pred_4 obj_02 obj_04)
       (pred_1 obj_04)
    )

    (:goal (and
       (pred_4 obj_02 obj_03)
    ))
(:constraints
  (always (not (pred_1 obj_06)))
)
)