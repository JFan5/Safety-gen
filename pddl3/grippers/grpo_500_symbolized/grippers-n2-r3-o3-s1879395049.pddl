(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_07 - type_1
obj_08 obj_05 obj_04 obj_11 - type_3
obj_12 obj_01 obj_03 - type_2
obj_09 obj_10 obj_06 - object)
(:init
(pred_4 obj_02 obj_01)
(pred_2 obj_02 obj_08)
(pred_2 obj_02 obj_05)
(pred_4 obj_07 obj_12)
(pred_2 obj_07 obj_04)
(pred_2 obj_07 obj_11)
(pred_3 obj_09 obj_03)
(pred_3 obj_10 obj_12)
(pred_3 obj_06 obj_03)
)
(:goal
(and
(pred_3 obj_09 obj_12)
(pred_3 obj_10 obj_12)
(pred_3 obj_06 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_02 obj_03) (pred_4 obj_07 obj_03))))
  )
)
)