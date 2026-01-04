(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_1
obj_08 obj_04 obj_13 obj_05 - type_2
obj_11 obj_03 obj_07 obj_09 - type_3
obj_01 obj_10 obj_06 - object)
(:init
(pred_4 obj_02 obj_07)
(pred_1 obj_02 obj_08)
(pred_1 obj_02 obj_04)
(pred_4 obj_12 obj_09)
(pred_1 obj_12 obj_13)
(pred_1 obj_12 obj_05)
(pred_2 obj_01 obj_03)
(pred_2 obj_10 obj_11)
(pred_2 obj_06 obj_11)
)
(:goal
(and
(pred_2 obj_01 obj_07)
(pred_2 obj_10 obj_07)
(pred_2 obj_06 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_02 obj_07) (pred_4 obj_12 obj_07))))
    (always (not (and (pred_4 obj_02 obj_09) (pred_4 obj_12 obj_09))))
  )
)
)