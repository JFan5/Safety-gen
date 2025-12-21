(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_09 - type_1
obj_04 obj_08 obj_11 obj_12 - type_3
obj_01 obj_02 obj_14 obj_03 - type_2
obj_10 obj_13 obj_07 obj_06 - object)
(:init
(pred_4 obj_05 obj_01)
(pred_2 obj_05 obj_04)
(pred_2 obj_05 obj_08)
(pred_4 obj_09 obj_02)
(pred_2 obj_09 obj_11)
(pred_2 obj_09 obj_12)
(pred_3 obj_10 obj_14)
(pred_3 obj_13 obj_01)
(pred_3 obj_07 obj_02)
(pred_3 obj_06 obj_02)
)
(:goal
(and
(pred_3 obj_10 obj_03)
(pred_3 obj_13 obj_03)
(pred_3 obj_07 obj_14)
(pred_3 obj_06 obj_14)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_05 obj_03) (pred_4 obj_09 obj_03))))
  )
)
)