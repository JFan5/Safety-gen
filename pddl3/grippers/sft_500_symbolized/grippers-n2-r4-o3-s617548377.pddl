(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_12 - type_1
obj_10 obj_01 obj_13 obj_08 - type_2
obj_06 obj_05 obj_07 obj_04 - type_3
obj_11 obj_03 obj_02 - object)
(:init
(pred_1 obj_09 obj_07)
(pred_3 obj_09 obj_10)
(pred_3 obj_09 obj_01)
(pred_1 obj_12 obj_04)
(pred_3 obj_12 obj_13)
(pred_3 obj_12 obj_08)
(pred_2 obj_11 obj_06)
(pred_2 obj_03 obj_05)
(pred_2 obj_02 obj_05)
)
(:goal
(and
(pred_2 obj_11 obj_05)
(pred_2 obj_03 obj_04)
(pred_2 obj_02 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_09 obj_05) (pred_1 obj_12 obj_05))))
    (always (not (and (pred_1 obj_09 obj_04) (pred_1 obj_12 obj_04))))
  )
)
)