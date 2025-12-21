(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_12 - type_1
obj_08 obj_13 obj_02 obj_05 - type_3
obj_10 obj_01 obj_04 obj_03 - type_2
obj_07 obj_06 obj_11 - object)
(:init
(pred_4 obj_09 obj_10)
(pred_2 obj_09 obj_08)
(pred_2 obj_09 obj_13)
(pred_4 obj_12 obj_01)
(pred_2 obj_12 obj_02)
(pred_2 obj_12 obj_05)
(pred_3 obj_07 obj_04)
(pred_3 obj_06 obj_10)
(pred_3 obj_11 obj_01)
)
(:goal
(and
(pred_3 obj_07 obj_01)
(pred_3 obj_06 obj_03)
(pred_3 obj_11 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_09 obj_04) (pred_4 obj_12 obj_04))))
    (always (not (and (pred_4 obj_09 obj_03) (pred_4 obj_12 obj_03))))
  )
)
)