(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_05 - type_1
obj_08 obj_11 obj_06 obj_10 - type_3
obj_03 obj_13 obj_07 obj_04 - type_2
obj_09 obj_02 obj_12 - object)
(:init
(pred_4 obj_01 obj_13)
(pred_2 obj_01 obj_08)
(pred_2 obj_01 obj_11)
(pred_4 obj_05 obj_07)
(pred_2 obj_05 obj_06)
(pred_2 obj_05 obj_10)
(pred_3 obj_09 obj_04)
(pred_3 obj_02 obj_04)
(pred_3 obj_12 obj_04)
)
(:goal
(and
(pred_3 obj_09 obj_04)
(pred_3 obj_02 obj_04)
(pred_3 obj_12 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_01 obj_04) (pred_4 obj_05 obj_04))))
  )
)
)