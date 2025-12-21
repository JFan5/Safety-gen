(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_13 - type_1
obj_03 obj_02 obj_01 obj_07 - type_3
obj_11 obj_08 obj_04 obj_12 - type_2
obj_09 obj_05 obj_10 - object)
(:init
(pred_4 obj_06 obj_04)
(pred_2 obj_06 obj_03)
(pred_2 obj_06 obj_02)
(pred_4 obj_13 obj_11)
(pred_2 obj_13 obj_01)
(pred_2 obj_13 obj_07)
(pred_3 obj_09 obj_04)
(pred_3 obj_05 obj_11)
(pred_3 obj_10 obj_11)
)
(:goal
(and
(pred_3 obj_09 obj_11)
(pred_3 obj_05 obj_11)
(pred_3 obj_10 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_06 obj_04) (pred_4 obj_13 obj_04))))
  )
)
)