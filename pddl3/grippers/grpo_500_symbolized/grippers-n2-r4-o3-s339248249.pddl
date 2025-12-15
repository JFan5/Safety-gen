(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_05 - type_1
obj_06 obj_03 obj_12 obj_08 - type_3
obj_07 obj_04 obj_09 obj_13 - type_2
obj_02 obj_01 obj_11 - object)
(:init
(pred_3 obj_10 obj_07)
(pred_4 obj_10 obj_06)
(pred_4 obj_10 obj_03)
(pred_3 obj_05 obj_04)
(pred_4 obj_05 obj_12)
(pred_4 obj_05 obj_08)
(pred_2 obj_02 obj_07)
(pred_2 obj_01 obj_13)
(pred_2 obj_11 obj_09)
)
(:goal
(and
(pred_2 obj_02 obj_09)
(pred_2 obj_01 obj_04)
(pred_2 obj_11 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_10 obj_04) (pred_3 obj_05 obj_04))))
  )
)
)