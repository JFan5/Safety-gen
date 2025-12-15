(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_03 - type_2
obj_12 obj_13 obj_11 obj_07 - type_1
obj_01 obj_09 obj_08 obj_04 - type_3
obj_06 obj_02 obj_10 - object)
(:init
(pred_2 obj_05 obj_01)
(pred_3 obj_05 obj_12)
(pred_3 obj_05 obj_13)
(pred_2 obj_03 obj_09)
(pred_3 obj_03 obj_11)
(pred_3 obj_03 obj_07)
(pred_1 obj_06 obj_08)
(pred_1 obj_02 obj_08)
(pred_1 obj_10 obj_04)
)
(:goal
(and
(pred_1 obj_06 obj_09)
(pred_1 obj_02 obj_04)
(pred_1 obj_10 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_05 obj_04) (pred_2 obj_03 obj_04))))
  )
)
)