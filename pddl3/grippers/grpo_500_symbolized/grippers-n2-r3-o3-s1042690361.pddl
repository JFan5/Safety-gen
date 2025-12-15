(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_05 - type_1
obj_11 obj_08 obj_07 obj_02 - type_3
obj_12 obj_03 obj_10 - type_2
obj_01 obj_04 obj_09 - object)
(:init
(pred_3 obj_06 obj_12)
(pred_4 obj_06 obj_11)
(pred_4 obj_06 obj_08)
(pred_3 obj_05 obj_03)
(pred_4 obj_05 obj_07)
(pred_4 obj_05 obj_02)
(pred_2 obj_01 obj_03)
(pred_2 obj_04 obj_10)
(pred_2 obj_09 obj_12)
)
(:goal
(and
(pred_2 obj_01 obj_12)
(pred_2 obj_04 obj_12)
(pred_2 obj_09 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_06 obj_03) (pred_3 obj_05 obj_03))))
  )
)
)