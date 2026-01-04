(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_06 - type_2
obj_07 obj_11 obj_08 obj_01 - type_1
obj_10 obj_13 obj_04 obj_09 - type_3
obj_03 obj_02 obj_12 - object)
(:init
(pred_3 obj_05 obj_13)
(pred_2 obj_05 obj_07)
(pred_2 obj_05 obj_11)
(pred_3 obj_06 obj_09)
(pred_2 obj_06 obj_08)
(pred_2 obj_06 obj_01)
(pred_4 obj_03 obj_10)
(pred_4 obj_02 obj_13)
(pred_4 obj_12 obj_04)
)
(:goal
(and
(pred_4 obj_03 obj_10)
(pred_4 obj_02 obj_04)
(pred_4 obj_12 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_05 obj_04) (pred_3 obj_06 obj_04))))
  )
)
)