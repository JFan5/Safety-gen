(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_06 obj_07 - type_1
obj_04 obj_02 obj_08 obj_11 - type_2
obj_09 obj_01 obj_10 - type_3
obj_03 obj_05 - object)
(:init
(pred_1 obj_06 obj_09)
(pred_3 obj_06 obj_04)
(pred_3 obj_06 obj_02)
(pred_1 obj_07 obj_10)
(pred_3 obj_07 obj_08)
(pred_3 obj_07 obj_11)
(pred_2 obj_03 obj_10)
(pred_2 obj_05 obj_10)
)
(:goal
(and
(pred_2 obj_03 obj_09)
(pred_2 obj_05 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_06 obj_09) (pred_1 obj_07 obj_09))))
  )
)
)