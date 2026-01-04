(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_06 - type_1
obj_04 obj_12 obj_14 obj_13 - type_2
obj_09 obj_05 obj_10 obj_07 - type_3
obj_11 obj_03 obj_08 obj_02 - object)
(:init
(pred_2 obj_01 obj_09)
(pred_3 obj_01 obj_04)
(pred_3 obj_01 obj_12)
(pred_2 obj_06 obj_10)
(pred_3 obj_06 obj_14)
(pred_3 obj_06 obj_13)
(pred_4 obj_11 obj_05)
(pred_4 obj_03 obj_07)
(pred_4 obj_08 obj_05)
(pred_4 obj_02 obj_05)
)
(:goal
(and
(pred_4 obj_11 obj_10)
(pred_4 obj_03 obj_10)
(pred_4 obj_08 obj_07)
(pred_4 obj_02 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_01 obj_10) (pred_2 obj_06 obj_10))))
    (always (not (and (pred_2 obj_01 obj_07) (pred_2 obj_06 obj_07))))
  )
)
)