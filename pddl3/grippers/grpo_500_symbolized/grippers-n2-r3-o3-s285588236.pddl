(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_03 - type_1
obj_12 obj_08 obj_07 obj_11 - type_3
obj_10 obj_09 obj_05 - type_2
obj_06 obj_02 obj_04 - object)
(:init
(pred_3 obj_01 obj_09)
(pred_4 obj_01 obj_12)
(pred_4 obj_01 obj_08)
(pred_3 obj_03 obj_05)
(pred_4 obj_03 obj_07)
(pred_4 obj_03 obj_11)
(pred_2 obj_06 obj_05)
(pred_2 obj_02 obj_10)
(pred_2 obj_04 obj_10)
)
(:goal
(and
(pred_2 obj_06 obj_05)
(pred_2 obj_02 obj_09)
(pred_2 obj_04 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_01 obj_09) (pred_3 obj_03 obj_09))))
  )
)
)