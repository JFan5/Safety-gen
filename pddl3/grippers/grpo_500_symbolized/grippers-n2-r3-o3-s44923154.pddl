(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_07 - type_1
obj_01 obj_04 obj_06 obj_02 - type_3
obj_10 obj_12 obj_03 - type_2
obj_05 obj_11 obj_08 - object)
(:init
(pred_3 obj_09 obj_12)
(pred_4 obj_09 obj_01)
(pred_4 obj_09 obj_04)
(pred_3 obj_07 obj_10)
(pred_4 obj_07 obj_06)
(pred_4 obj_07 obj_02)
(pred_2 obj_05 obj_03)
(pred_2 obj_11 obj_03)
(pred_2 obj_08 obj_03)
)
(:goal
(and
(pred_2 obj_05 obj_10)
(pred_2 obj_11 obj_10)
(pred_2 obj_08 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_09 obj_03) (pred_3 obj_07 obj_03))))
  )
)
)